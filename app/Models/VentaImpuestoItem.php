<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class VentaImpuestoItem
 * 
 * @property int $idVentaImpuesto
 * @property int $idVentaItem
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
 * @property VentaItem $venta_item
 *
 * @package App\Models
 */
class VentaImpuestoItem extends Model
{
	protected $table = 'venta_impuesto_item';
	protected $primaryKey = 'idVentaImpuesto';
	public $timestamps = false;

	protected $casts = [
		'idVentaItem' => 'int',
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
		'idVentaItem',
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

	public function venta_item()
	{
		return $this->belongsTo(VentaItem::class, 'idVentaItem');
	}
}
