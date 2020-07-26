<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CompraImpuesto
 * 
 * @property int $idCompraImpuesto
 * @property int $idCompra
 * @property int $idImpuesto
 * @property float $monto
 * @property float $montoTasa
 * @property float $montoTotal
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Compra $compra
 * @property Impuesto $impuesto
 *
 * @package App\Models
 */
class CompraImpuesto extends Model
{
	protected $table = 'compra_impuesto';
	protected $primaryKey = 'idCompraImpuesto';
	public $timestamps = false;

	protected $casts = [
		'idCompra' => 'int',
		'idImpuesto' => 'int',
		'monto' => 'float',
		'montoTasa' => 'float',
		'montoTotal' => 'float',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCreacion'
	];

	protected $fillable = [
		'idCompra',
		'idImpuesto',
		'monto',
		'montoTasa',
		'montoTotal',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function compra()
	{
		return $this->belongsTo(Compra::class, 'idCompra');
	}

	public function impuesto()
	{
		return $this->belongsTo(Impuesto::class, 'idImpuesto');
	}
}
