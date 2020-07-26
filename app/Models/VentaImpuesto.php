<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class VentaImpuesto
 * 
 * @property int $idVentaImpuesto
 * @property int $idVenta
 * @property int $idImpuesto
 * @property float $monto
 * @property float $montoTasa
 * @property float $montoTotal
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Impuesto $impuesto
 * @property Venta $Venta
 *
 * @package App\Models
 */
class VentaImpuesto extends Model
{
	protected $table = 'venta_impuesto';
	protected $primaryKey = 'idVentaImpuesto';
	public $timestamps = false;

	protected $casts = [
		'idVenta' => 'int',
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
		'idVenta',
		'idImpuesto',
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

	public function Venta()
	{
		return $this->belongsTo(Venta::class, 'idVenta');
	}
}
