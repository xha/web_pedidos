<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CompraImpuestoItem
 * 
 * @property int $idCompraImpuesto
 * @property int $idCompraItem
 * @property int $idImpuesto
 * @property int $numeroLinea
 * @property float $monto
 * @property float $montoTasa
 * @property float $montoTotal
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Impuesto $impuesto
 * @property CompraItem $compra_item
 *
 * @package App\Models
 */
class CompraImpuestoItem extends Model
{
	protected $table = 'compra_impuesto_item';
	protected $primaryKey = 'idCompraImpuesto';
	public $timestamps = false;

	protected $casts = [
		'idCompraItem' => 'int',
		'idImpuesto' => 'int',
		'numeroLinea' => 'int',
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
		'idCompraItem',
		'idImpuesto',
		'numeroLinea',
		'monto',
		'montoTasa',
		'montoTotal',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function impuesto()
	{
		return $this->belongsTo(Impuesto::class, 'idImpuesto');
	}

	public function compra_item()
	{
		return $this->belongsTo(CompraItem::class, 'idCompraItem');
	}
}
